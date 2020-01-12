From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jan 2020 21:08:49 +0100
Subject: [Buildroot] What do we want to do with Python2?
In-Reply-To: <CALFsTFUYfPhOaJTei-sGrbNNY1WBP1TG55UyZywPys_3R3E=Kw@mail.gmail.com>
References: <CALFsTFUYfPhOaJTei-sGrbNNY1WBP1TG55UyZywPys_3R3E=Kw@mail.gmail.com>
Message-ID: <20200112210849.0e300c45@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Asaf,

On Sun, 12 Jan 2020 21:15:12 +0200
Asaf Kahlon <asafka7@gmail.com> wrote:

> As we all know, from the beginning of this year, Python2 is not
> officially maintained anymore.
> In addition, some major python packages started to drop support for
> Python2 recently. One example is the latest setuptools release
> (45.0.0) which added 'python_requires` validation for Python 3.5 or
> later.
> 
> Do we have any plan for removing Python2 support in Buildroot? If so,
> do we know for which version we want it to be relevant?
> Of course, I'll be more than happy to help with the process.

An effort was started by Titouan during the last Buildroot Developers
Meeting, and the first step he started with is to ensure that all
packages in Buildroot can work with Python 3.x, which is not yet the
case. Titouan has a status page at
https://elinux.org/Buildroot:Python2Packages. I'm sure you can
participate to that effort, just make sure to sync with Titouan (he is
on IRC, so it's easy to sync if needed).

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
