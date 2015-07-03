From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 03 Jul 2015 09:01:40 +0200
Subject: [Buildroot] [PATCH 1/1] python-networkmanager: bump to version
	0.9.13
In-Reply-To: <1435897332-1858-1-git-send-email-petr.vorel@gmail.com> (Petr
 Vorel's message of "Fri, 3 Jul 2015 06:22:12 +0200")
References: <1435897332-1858-1-git-send-email-petr.vorel@gmail.com>
Message-ID: <87pp49ybaj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Petr" == Petr Vorel <petr.vorel@gmail.com> writes:

 > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
 > ---
 >  package/python-networkmanager/python-networkmanager.hash | 4 ++--
 >  package/python-networkmanager/python-networkmanager.mk   | 2 +-
 >  2 files changed, 3 insertions(+), 3 deletions(-)

 > diff --git a/package/python-networkmanager/python-networkmanager.hash
 > b/package/python-networkmanager/python-networkmanager.hash
 > index 6c6f697..9323336 100644
 > --- a/package/python-networkmanager/python-networkmanager.hash
 > +++ b/package/python-networkmanager/python-networkmanager.hash
 > @@ -1,3 +1,3 @@
 >  # md5 from
 > https://pypi.python.org/pypi?:action=show_md5&digest=2cd400a7ca4dcd1ea98c864007032494,
 > sha256 locally computed
 > -md5	2cd400a7ca4dcd1ea98c864007032494  python-networkmanager-0.9.12.tar.gz
 > -sha256	a4c7bbae8a1ee3cf370ff0cd2ba2e0f1fb7f8e8f99f8f48a1df624c19a11166f  python-networkmanager-0.9.12.tar.gz
 > +md5	fbae1f2b0140c560222fed95a259753d  python-networkmanager-0.9.13.tar.gz

You forgot to change the upstream hash link. Committed with that fixed,
thanks.

-- 
Bye, Peter Korsgaard
