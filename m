From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 12 Jun 2017 06:08:59 +0200
Subject: [Buildroot] [PATCH 02/14] package/irrlicht: new package
References: <20170411222643.9770-1-romain.naour@gmail.com>
 <1108a7ef-12c0-8e55-1a6f-22f9b4bae251@t-online.de>
 <007c55a8-b229-7d5d-1a73-c81057d53ca7@gmail.com>
 <cba4449d-096e-a698-c55e-6a2c52c9048d@mind.be>
Message-ID: <rng11exo2s.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 11 Jun 2017 23:33:27 +0200 schrieb Arnout Vandecappelle:

> On 11-06-17 23:09, Romain Naour wrote:
>> Hi Bernd,
>> 
>> Thank for the review, it's very appreciated :)
>> 
>> Le 11/06/2017 ? 18:54, Bernd Kuhls a ?crit :
>>> Hi Romain,
>>>
>>> afaics the irrlicht package only provides libirrlicht.so.
>>> What about naming the package libirrlicht and move it to
>>> "Target packages > Libraries > Graphics"?
>> 
>> Make sense even if irrlicht is the upstream name.
>> In the past, I hesitated to do so for efl package which can be named 
libefl.
> 
>  No, in Buildroot, we always use the upstream name (except for python-* 
etc.).

Hi Arnout,

this is not true for example for libcurl, libfribidi, libglew, libglfw 
and libspandsp whose respective upstream project names also lack "lib".

Regards, Bernd
