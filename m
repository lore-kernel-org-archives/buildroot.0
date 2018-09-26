From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 25 Sep 2018 23:54:41 -0300
Subject: [Buildroot] [PATCH 1/1] python3: Downgrade to 3.6.6
References: <CALFsTFXK+2NB0tAJEkkyGi_QgErj18fGPg5rFN0bmfvjRLtFzg@mail.gmail.com>
Message-ID: <5baaf4f15f1fe_5ea43fa0300957d02717a@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+ Yegor

On Tue, Sep 25, 2018 at 05:12 PM, Asaf Kahlon wrote:

[reordered to give context]
> On Tue, Sep 25, 2018 at 10:56 PM Thomas Petazzoni <
> thomas.petazzoni at bootlin.com> wrote:
[snip]
>> Asaf, do you think you could help in that effort, perhaps by looking at
>> crossbar and twisted ?
[/reordered]

> Yes, I will try to fix at least on of them (hopefully) tomorrow.

I am glad to hear you will work on this.
You have more experience than me on bumping python packages.

I started bumping crossbar locally but I didn't went far yet due to lack of
time.
Hint: start with twisted as it is a requirement for crossbar.

Here is my WIP branch. It contains incomplete work (not fully tested), but if
you see anything that you like please feel free to grab, don't need to keep any
authorship:
https://gitlab.com/RicardoMartincoski/buildroot/commits/python-crossbar-bump-v1

Regards,
Ricardo
