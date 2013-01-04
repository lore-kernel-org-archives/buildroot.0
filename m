From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 04 Jan 2013 22:15:54 +0100
Subject: [Buildroot] [PATCH] packages: add tzdata
In-Reply-To: <20130104134155.4ff8f301@skate> (Thomas Petazzoni's message of
 "Fri, 4 Jan 2013 13:41:55 +0100")
References: <1357300124-7011-1-git-send-email-rbraun@sceen.net>
 <20130104125447.04031e67@skate>
 <20130104120759.GA10338@mail.sceen.net>
 <20130104134155.4ff8f301@skate>
Message-ID: <87mwwolkdx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> Hum, good question. Maybe you can keep it as you proposed, but increase
 Thomas> the help text about uClibc, explaining that this is generally mostly
 Thomas> useful with glibc, but kept available for uClibc in case a specific
 Thomas> application makes use of tzdata.

I would just keep it glibc-only for now to limit confusion. I've never
heard about any other program using it.

-- 
Bye, Peter Korsgaard
