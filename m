From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 19 Feb 2009 12:12:49 +0100
Subject: [Buildroot] BR-2009.01 U-Boot not working on my AT91SAM9261ek
	Board
In-Reply-To: <BAY124-DS7756E1F27FE5A88524B2BD2B20@phx.gbl>
	(quickx@hotmail.com's message of "Wed\,
	18 Feb 2009 16\:58\:06 -0800")
References: <BAY124-DS7756E1F27FE5A88524B2BD2B20@phx.gbl>
Message-ID: <871vtubrym.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "QuickX" == QuickX  <quickx@hotmail.com> writes:

Hi,

 QuickX> I've finally had some time to attempt to update my project to
 QuickX> BR-2009.02 and noticed some things, so thought I'd share.
 
 QuickX> 1. microperl (default config option) doesn't build on Kubuntu
 QuickX> 8.10 (Make Errors).

Details please.

 QuickX> 2. php (default config option) doesn't build on Kubuntu 8.10
 QuickX> (it doesn't try to download but complains it can't find it in
 QuickX> the dl directory).

Details please.

 QuickX> 3. U-Boot (Add architecture specific patch -> Add AT91
 QuickX> specific patches to u-Boot) causes u-Boot to not work on
 QuickX> board.
 
 QuickX> Little more info on "3" is if this option is set (default)
 QuickX> then Hyperterminal sits at the at91bootstrap message forever
 QuickX> and doesn't load u-boot.  If I turn this option off and then
 QuickX> issue the following, it works.

Sigh, Ulf - This is your mess, please sort it out.

-- 
Bye, Peter Korsgaard
