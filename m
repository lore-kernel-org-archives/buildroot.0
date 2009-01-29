From: Hamish Moffatt <hamish@cloud.net.au>
Date: Fri, 30 Jan 2009 10:09:04 +1100
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <D4FF4B0197F54EE4BC14E179A2F17F15@aeglos>
References: <20090127125650.GA18250@cloud.net.au>
	<D4FF4B0197F54EE4BC14E179A2F17F15@aeglos>
Message-ID: <20090129230904.GA13929@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 29, 2009 at 03:33:08PM +0100, Ulf Samuelsson wrote:
>> The current logic of trying xconfig then menuconfig is very ugly - does
>> it allow you to abort xconfig without falling back?
>
> If you could abort the xconfig without running menuconfig,
> then you would not have a config file and the build would abort.
> What is the sense of that?

You could have an exising config, start editing then change your mind.
You don't want menuconfig to launch in that case.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
