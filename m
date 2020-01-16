From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Jan 2020 11:03:06 +0100
Subject: [Buildroot] [PATCH] infra: add the transient download mechanism
In-Reply-To: <CAOf5uwmX0vdPFW9s9fC64Q7DFvQGCWdSqZy4GjEPrryy8Sa9ZA@mail.gmail.com>
References: <20200115203753.12110-1-yann.morin.1998@free.fr>
 <534f269547ead6d86e7a571978b54d79cd24cd0d.camel@orolia.com>
 <20200116103120.7b41295a@windsurf>
 <CAOf5uwmX0vdPFW9s9fC64Q7DFvQGCWdSqZy4GjEPrryy8Sa9ZA@mail.gmail.com>
Message-ID: <20200116110306.5c91286b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 16 Jan 2020 10:56:53 +0100
Michael Nazzareno Trimarchi <michael@amarulasolutions.com> wrote:

> We are using a similar setup of Nicolas. Right now we have
> CI and reproducible build using external tools. What I would like to solve
> with buildroot is:
> 
> - make the build reproducible
> - implement topic build on custom patch using CI
> - make tagging and branching easy

Could you give more details, because these items are quite vague/fuzzy,
and I don't understand from a very practical point of view what you
mean. Could you describe some example workflow, what would be your
expectation of Buildroot's behavior, etc.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
