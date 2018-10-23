From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 23 Oct 2018 08:11:46 -0500
Subject: [Buildroot] [PATCH 1/1] ntp: added S48ntpdate script
In-Reply-To: <CALtfCQaoFEraPV6thCvC6NTOUr3SzN1uGvmo6UFRVa1H1ZcSCw@mail.gmail.com>
References: <1539964343-10526-1-git-send-email-oscargomezf@gmail.com>
 <CANQCQpZcDx+fdZmh6MZypVDCWU8JJbqR0XqqBDbC4T8HnNopXw@mail.gmail.com>
 <CALtfCQZiF0jhNwSUXS+qgEN2oHhqkxwF56V31Ymp-_5LzcWD=Q@mail.gmail.com>
 <CANQCQpZQy=58rDrKgPP7yN_X3gCLRS4gLDneEcuPVDrVQH0AFA@mail.gmail.com>
 <CANQCQpZkWNHkDW+hNL9a=mDH+WSC+=2h-JJihfoWmrn7CqB_jw@mail.gmail.com>
 <CALtfCQaoFEraPV6thCvC6NTOUr3SzN1uGvmo6UFRVa1H1ZcSCw@mail.gmail.com>
Message-ID: <CANQCQpZiwZCaK2x=hZvO6YFE-43qy3GYksQHKXg_L8HQWOmWJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Oscar,

On Tue, Oct 23, 2018 at 2:59 AM Oscar Gomez Fuente
<oscargomezf@gmail.com> wrote:
>
> Hi Matthew,
>
> > If it's Ok with you, I'll send a v2 patch tonight and include your signed-off.
> >
> > I fixed the args (should have been -g -q) and added a timeout loop to
> > manage the fact that unlike ntpdate, ntpd won't return if there is no
> > network connection or the server can't be reached.
>

This series is superseded by http://patchwork.ozlabs.org/patch/988212/

Matt
