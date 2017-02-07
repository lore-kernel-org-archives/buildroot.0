From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 06 Feb 2017 23:10:00 -0200
Subject: [Buildroot] [PATCH 7/9] docs/manual: size of tab in package
 description
References: <ee0a60b2-6887-f7aa-1cca-882b77d6f307@gmail.com>
Message-ID: <58991e686fab0_1b4d3ff5d4ca98b031c2@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Sat, Jan 21, 2017 at 02:58 PM, Romain Naour wrote:

> Le 31/12/2016 ? 04:21, Ricardo Martincoski a ?crit :
>> Explicitly state that one tab counts for 8 columns in package
>> description, leaving 62 characters to the text itself.
>> Update the text and the example in the two places where the Config.in
>> format is described.
>> Also mention a newline is expected between the help text itself and the
>> upstream URL.
> 
> I started to use these scripts today, and it's really a nice work!
> My current setting in my editor use 4 characters for one tab, so all packages I
> made until now produce a check_help_text warning :-(
> But ok, 8 spaces for one tab seems to be the default for a long time [1].
> 
> [1] https://en.wikipedia.org/wiki/Tab_key

I missed to add to the commit message that I based that info in past reviews...

http://patchwork.ozlabs.org/patch/611289/
http://patchwork.ozlabs.org/patch/606866/
http://patchwork.ozlabs.org/patch/459960/

Best regards,
Ricardo
