From: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
Date: Fri, 24 Apr 2015 16:49:41 +0200
Subject: [Buildroot] integrating MariaDB Galera Cluster into BR
Message-ID: <553A5805.3080701@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Dear all,

I would like to integrate MariaDB Galera Cluster
(https://mariadb.com/kb/en/mariadb/what-is-mariadb-galera-cluster/)
into Buildroot. Before I prepare and submit patches I would like to
ask a few questions about how to do things properly: MariaDB conflicts
with MySQL (they install the same files). Should I:

 a) Create a meta-package, for example "mysql compatible DB", the
selection of which would let the user choose between MariaDB Galera
Cluster or MySQL?

 b) Integrate MariaDB Galera Cluster into MySQL package and let the
user choose which implementation he wants?

 c) Make these packages mutually exclusive using "depends on !"?


Cheers,

Sylvain

- -- 
Sylvain Raybaud
www.green-communications.fr
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVOlgFAAoJEEkkwl4JtJ9yOKIQALfJAo7xOEYYOka3Q3dPOVeF
F/z2I1/Z1rS+x7bQi+QL2LunRE8ESWOLQIG1GHzwILrSg//lVbXuNHu9ZNSfvZpJ
MYdmWutbElopWlDOO7HmrQbKtatqELDKBRH+izPtZHB/tZrHkKCbrsTsj7u95jC9
C1NNCVVDS6X9HbPbesGye9A5hZrKB+j72A7J2jbwhA0xw7PfTbaMD6bcXmhKISvU
gAx0xzb/oFaTvtxxiJ8lqgjiukYpg6kPVK875yXdwFNZlW8DzHbif8kvWrJyO7cY
Ip+XFmNncf7pZHJu5sLHHtohoDg70P2MYoDfSks+ScFd3y/KEzWFfFvzlPH/mM3k
SVgzVmNeXgUM0bTxp9qkMRcjW0JoxQqt/AAxl7juaxC3beXiI24998R+o7suO5zd
NHCx6kwa3b0sgpYRApvkXWlXbAUFatkYSxZQ3PpYx+lSIDQt36xiEA52sXCCCutu
g64J4LIEm/xIfPrHpBuWJi21FnavjbvHqVtSWiPx5TwxzJ3XoOzV289CwKJozkdD
Dp/yJIiiH4vVIXSC7nq33kclcno3/eO1mIn0Z8U6fJhPN0kjOrNQ6R/zooC7qJje
53zFHwaZ+TtMfAxaEYavzoI8i+Bfl140yK99oDCiXVWtdJsuQrW3pcNcK45FVji7
ZPts496plApkgnlSs5CX
=44RM
-----END PGP SIGNATURE-----
