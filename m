From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 6 Apr 2016 12:47:13 -0300
Subject: [Buildroot] [buildroot] overlay linux patches
In-Reply-To: <CALtfCQbf5g4C5jYVidZUfSbscKADtFFR7CBsg_LFJGwrYH3GNQ@mail.gmail.com>
References: <CALtfCQbf5g4C5jYVidZUfSbscKADtFFR7CBsg_LFJGwrYH3GNQ@mail.gmail.com>
Message-ID: <57052F81.5060705@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06/04/16 10:32, Oscar Gomez Fuente wrote:

> Hi,
>
> Is there anyway to overlay linux patches on buildroot? I want to keep
> the default patches on linux directory and add a few patches more.
>
> I don't know if adding the extra packets on
> board/company_name/project_name/patches/linux it's enough??
>
> Thanks.
>
> Oscar Gomez Fuente.

Hi. Use the docs luke:
https://buildroot.org/downloads/manual/manual.html#patch-policy

"Global patch directory".

Regards.
