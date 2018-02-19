#!/usr/bin/env python

from __future__ import print_function
import os


def link_dotfiles(env='base'):
    user_home = os.environ.get('HOME')
    for directory, subdirectory, files in os.walk(os.getcwd()):
        for f in files:
            if 'dot-' in f:
                src =  os.path.join(directory, f)
                dest = os.path.join(user_home, f.replace('dot-', '.'))
                try:
                    os.symlink(src, dest)
                except OSError:
                    os.unlink(dest)
                    os.symlink(src, dest)
                print('linked: {} --> {}'.format(src, dest))


if __name__ == '__main__':
    link_dotfiles()
