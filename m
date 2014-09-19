From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 19 Sep 2014 23:17:26 +0200
Subject: [Buildroot] [PATCH 1/2] lua: add hash
In-Reply-To: <1411151424-31768-1-git-send-email-francois.perrad@gadz.org>
 (Francois Perrad's message of "Fri, 19 Sep 2014 20:30:23 +0200")
References: <1411151424-31768-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <87bnqb48ex.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 > ---
 >  package/lua/lua.hash | 6 ++++++
 >  1 file changed, 6 insertions(+)
 >  create mode 100644 package/lua/lua.hash

 > diff --git a/package/lua/lua.hash b/package/lua/lua.hash
 > new file mode 100644
 > index 0000000..7bc7933
 > --- /dev/null
 > +++ b/package/lua/lua.hash
 > @@ -0,0 +1,6 @@
 > +# Hashes from: http://www.lua.org/ftp/
 > +md5: dc7f94ec6ff15c985d2d6ad0f1b35654           lua-5.2.3.tar.gz
 > +sha1: 926b7907bc8d274e063d42804666b40a3f3c124c  lua-5.2.3.tar.gz
 > +
 > +md5: 2e115fe26e435e33b0d5c022e4490567           lua-5.1.5.tar.gz
 > +sha1: b3882111ad02ecc6b972f8c1241647905cb2e3fc  lua-5.1.5.tar.gz

Committed with the syntax corrected, thanks.

-- 
Bye, Peter Korsgaard
