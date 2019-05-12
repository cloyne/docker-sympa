Image extending [tozd/sympa](https://github.com/tozd/docker-sympa) image to configure it for
[Cloyne](http://cloyne.org/).

**It contains hard-coded values used at the Cloyne deployment.**

Note: Depending on the name of the mailing list being added, you may have to edit /srv/sympa/etc/shared/sympa_transport to prevent it from bouncing as "unknown user". Afterwards, restart postfix:

    `--# docker exec -ti mail script -q -c "/bin/bash" /dev/null
    root@mail:# postfix reload
