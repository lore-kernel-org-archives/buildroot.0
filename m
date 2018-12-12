From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Dec 2018 16:30:36 +0100
Subject: [Buildroot] strace on xtensa/uclibc
In-Reply-To: <CAMo8BfKeJ-PjnZp-rYQmkRrFE3SFO_-LyAZ5gL6B1RuMryJWiQ@mail.gmail.com>
References: <20181207070029.CF0512073D@mail.bootlin.com>
 <20181207091356.605a9c69@windsurf>
 <20181211135024.3e80c5db@windsurf>
 <CAMo8BfKeJ-PjnZp-rYQmkRrFE3SFO_-LyAZ5gL6B1RuMryJWiQ@mail.gmail.com>
Message-ID: <20181212163036.72818d89@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Dec 2018 07:27:58 -0800, Max Filippov wrote:

> On Tue, Dec 11, 2018 at 4:50 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> > Waldemar, Max, any input on the below issue ?  
> 
> I agree with your analysis, I've posted fixes to uclibc-ng and buildroot lists.

Just seen your patches, thanks for them! I haven't tested them, but it
obviously looks like the right solution.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
