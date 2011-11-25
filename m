From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 25 Nov 2011 20:12:42 -0300
Subject: [Buildroot] [PATCH 2/2] ruby: fix host build breakage
In-Reply-To: <CAHUNapSBEBeuTm0aLY2z4MO8NkSSRLNqz95oW+JkwDsSoBQqGQ@mail.gmail.com>
References: <1322220912-20268-1-git-send-email-gustavo@zacarias.com.ar>
 <1322220912-20268-2-git-send-email-gustavo@zacarias.com.ar>
 <CAHUNapSE2JNQ7siBttu2339S51TM-tS3JVsHAeV9oudv2k8B-A@mail.gmail.com>
 <CAHUNapSBEBeuTm0aLY2z4MO8NkSSRLNqz95oW+JkwDsSoBQqGQ@mail.gmail.com>
Message-ID: <c68e204e7e586c2b3ee9e94f03d9a6d6@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25.11.2011 14:32, Trevor Woerner wrote:

> I should also point out... the additional flags you provide are only
> required if the ncurses package is scheduled to be built, but I don't
> think it matters if they are conditional or not.

Yes, there's no need to make it conditional.
If there's no ncurses/readline then no harm is done by "forcibly" 
disabling them.
Even so it's just for the host ruby, not the target.
Regards.
