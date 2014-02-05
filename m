From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 5 Feb 2014 12:47:16 +0100
Subject: [Buildroot] [PATCH] dependencies.sh: cleanup dependencies.sh
In-Reply-To: <CAGduivzutuoD1mhfg6Oxo1DYKz+C+kak62Q0c=g_v7TehC3vuA@mail.gmail.com>
References: <1391459047-23665-1-git-send-email-maxime.hadjinlian@gmail.com>
 <52F1132F.1050008@lucaceresoli.net>
 <CAGduivzutuoD1mhfg6Oxo1DYKz+C+kak62Q0c=g_v7TehC3vuA@mail.gmail.com>
Message-ID: <CAAXf6LVjgPSeSfDoDVdy3tCTq2VmQYqG6O8xytd9UHCmQBF72A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Feb 4, 2014 at 11:35 PM, Maxime Hadjinlian
<maxime.hadjinlian@gmail.com> wrote:
[..]
>>
>> Are you really suggesting we should remove all nesting? Well, I guess
>> there's been a problem with the e-mail or something...
> Well, I asked Peter before doing this, the file contained mixed indents. We
> thought it would be nice to have a consistent indent with the Mk files.
>
> But if we find we don't want that because it removes clarity in the code. I
> can perfectly resend with only the space/tab fixed.
>
> I really don't have a strong opinion on this one. Thomas Petazzoni and Yann
> E. Morin also found it disturbing.
> Peter what is your decision ?
>>

My preference would be to keep indenting nested levels, but
consistently with either tabs or spaces. As there are sometimes 4
nested levels, not indenting makes it hard to understand at first
sight.

Best regards,
Thomas
