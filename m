From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 11 Nov 2015 21:50:49 +0100
Subject: [Buildroot] [PATCH] docs/manual: fix bash export syntax in
 example code
In-Reply-To: <20151111185124.5ebd908f@free-electrons.com>
References: <1447264061-21523-1-git-send-email-luca@lucaceresoli.net>
 <20151111185124.5ebd908f@free-electrons.com>
Message-ID: <5643AA29.6060606@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Thomas Petazzoni wrote:
> Dear Luca Ceresoli,
>
> On Wed, 11 Nov 2015 18:47:41 +0100, Luca Ceresoli wrote:
>> To export a variable in .bashrc we shouldn't put a '$' at the
>> beginning of the line, and there must be a '=' between key and value.
>
> Well the $ is here to indicate that it's the shell prompt.

I would agree if this specific part of the manual were suggesting a
shell command in general. Instead it's suggesting to add a line to
~/.bashrc, where a '$' does not make sense of course.

Maybe I should have explained it in my commit message?

-- 
Luca
