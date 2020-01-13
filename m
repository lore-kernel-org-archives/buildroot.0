From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Mon, 13 Jan 2020 11:03:26 +0100
Subject: [Buildroot] What do we want to do with Python2?
In-Reply-To: <20200112210849.0e300c45@windsurf>
References: <CALFsTFUYfPhOaJTei-sGrbNNY1WBP1TG55UyZywPys_3R3E=Kw@mail.gmail.com>
 <20200112210849.0e300c45@windsurf>
Message-ID: <f0badb1d-2bf7-fb3b-6564-65f1f8c6a4b0@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Asaf, Thomas and all,

On 1/12/20 9:08 PM, Thomas Petazzoni wrote:
> Hello Asaf,
> 
> On Sun, 12 Jan 2020 21:15:12 +0200
> Asaf Kahlon <asafka7@gmail.com> wrote:
> 
>> As we all know, from the beginning of this year, Python2 is not
>> officially maintained anymore.
>> In addition, some major python packages started to drop support for
>> Python2 recently. One example is the latest setuptools release
>> (45.0.0) which added 'python_requires` validation for Python 3.5 or
>> later.
>>
>> Do we have any plan for removing Python2 support in Buildroot? If so,
>> do we know for which version we want it to be relevant?
>> Of course, I'll be more than happy to help with the process.
> 
> An effort was started by Titouan during the last Buildroot Developers
> Meeting, and the first step he started with is to ensure that all
> packages in Buildroot can work with Python 3.x, which is not yet the
> case. Titouan has a status page at
> https://elinux.org/Buildroot:Python2Packages. I'm sure you can
> participate to that effort, just make sure to sync with Titouan (he is
> on IRC, so it's easy to sync if needed).

I did not had so much time to continue on the Py2 deprecation track 
since the ELCE developer meeting, but I intend to continue at the next 
one (FOSDEM).

In my opinion, we should strive for a Python3 only Buildroot for the 
2021.02 release, and use the year 2020 to either remove Py2-only 
packages, or wait for an upstream update. I would like to prioritize the 
packages that use Python at compile time, because that would allow us to 
get rid of host-python2 first (maybe even for the 2020.05 ?).

If you would like to participate, it would be great if you could keep 
track of our progress on the Wiki page 
https://elinux.org/Buildroot:Python2Packages . Since you're one of the 
main Python packages contributors, your expertise would be much 
appreciated :)

Best regards,

Titouan

> 
> Best regards,
> 
> Thomas Petazzoni
> 
