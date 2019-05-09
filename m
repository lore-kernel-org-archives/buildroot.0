From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 09 May 2019 09:32:01 +0200
Subject: [Buildroot] [PATCH] CHANGES: fix missing "binutils" in
 2019.05-rc1 description
In-Reply-To: <20190509065155.21279-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 9 May 2019 08:51:54 +0200")
References: <20190509065155.21279-1-thomas.petazzoni@bootlin.com>
Message-ID: <875zqkhymm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 >  CHANGES | 4 ++--
 >  1 file changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/CHANGES b/CHANGES
 > index 6fb63479ee..fb9e2e70c5 100644
 > --- a/CHANGES
 > +++ b/CHANGES
 > @@ -8,8 +8,8 @@
 >  	not just when not available on the build host.
 
 >  	Toolchain: Glibc bumped to 2.29, musl bumped to 1.1.22,
 > -	binutils 2.32 added, 2.28/2.29 removed, default changed to
 > -	2.31.1.
 > +	binutils 2.32 added, binutils 2.28/2.29 removed, default
 > +	changed to 2.31.1.

I actually did this on purpose as the entire line is about binutils, so
it is implied for the removed / default part.

But I don't really feel strongly about it. If you find this way clearer
then feel free to apply.

-- 
Bye, Peter Korsgaard
