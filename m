From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 02 Apr 2020 21:44:35 +0200
Subject: [Buildroot] [PATCH 1/1] docs/manual: minor typo fix
In-Reply-To: <a7c96e3f84a64afda9548fd5f535d40f@genemek.com> (=?utf-8?Q?=22?=
 =?utf-8?Q?Naz=C4=B1m?= Gediz
 =?utf-8?Q?AYDINDO=C4=9EMU=C5=9E=22's?= message of "Thu, 2 Apr 2020 12:41:12
 +0000")
References: <a7c96e3f84a64afda9548fd5f535d40f@genemek.com>
Message-ID: <87y2rd8yfw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Naz?m" == Naz?m Gediz AYDINDO?MU? <gediz.aydindogmus@genemek.com> writes:

 > MIME-Version: 1.0
 > Content-Type: text/plain; charset=UTF-8
 > Content-Transfer-Encoding: 8bit

 > Definition of LIBFOO_USERS actually ends on 33rd line.

 > Signed-off-by: Naz?m Gediz Ayd?ndo?mu? <gediz.aydindogmus@genemek.com>
 > ---
 > docs/manual/adding-packages-generic.txt | 2 +-
 > 1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/docs/manual/adding-packages-generic.txt
 > b/docs/manual/adding-packages-generic.txt
 > index 8ee51ca57d..ed1e6acf57 100644
 > --- a/docs/manual/adding-packages-generic.txt
 > +++ b/docs/manual/adding-packages-generic.txt
 > @@ -142,7 +142,7 @@ All these steps rely on the +$(@D)+ variable, which
 > contains the directory where the source code of the package has been
 > extracted.

 > -On lines 31..43, we define a user that is used by this package (e.g.
 > +On lines 31..33, we define a user that is used by this package (e.g.
 > to run a daemon as non-root) (+LIBFOO_USERS+).

Your mailed had unfortunately corrupted the patch, but I've fixed it up
manually and applied, thanks!

-- 
Bye, Peter Korsgaard
