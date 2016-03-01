From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Mar 2016 23:24:31 +0100
Subject: [Buildroot] Buildroot 2016.02 released
In-Reply-To: <CAJJ6jxtaKja3gpcoG+ex8mat5Lw+R=mMeWk3CO2uPCA9jZf+OA@mail.gmail.com>
References: <87lh61kikr.fsf@dell.be.48ers.dk>
 <CAJJ6jxtaKja3gpcoG+ex8mat5Lw+R=mMeWk3CO2uPCA9jZf+OA@mail.gmail.com>
Message-ID: <20160301232431.4be5e1c3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Steve,

On Tue, 1 Mar 2016 14:06:24 -0800, Steve Calfee wrote:

> I have a suggestion for GSOC.

Unfortunately, we just learned yesterday that the Buildroot has again
not be selected by Google to be part of the upcoming Google Summer of
Code program.

> How about give the intern a raspberry pi
> (or any other dedicated, embedded system) and try to implement locale
> and utf8 for a busybox system? That will not help buildroot
> development, but would really help buildroot users.

I am not sure what is missing to achieve what you suggest. We already
have locale support, and some of these locales use the UTF-8 charset.

Can you describe more precisely what doesn't work for you?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
