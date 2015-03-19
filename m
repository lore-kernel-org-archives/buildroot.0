From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 19 Mar 2015 11:25:05 +0100
Subject: [Buildroot] Worried about patches not being merged?
In-Reply-To: <CA+TH9Vm9myq5YS_3+CsvT5-SZXcGyug3KDUO0Ai8f+daMf6BYg@mail.gmail.com>
References: <20150304232101.437af48f@free-electrons.com>
 <1426708866.1395.8.camel@embedded.rocks>
 <CA+TH9VmRWPdidNHSLArTek4Pxxtw+viOy7_tMbMYturnq0-VaQ@mail.gmail.com>
 <20150319101643.6a4eeed3@free-electrons.com>
 <CA+TH9Vm9myq5YS_3+CsvT5-SZXcGyug3KDUO0Ai8f+daMf6BYg@mail.gmail.com>
Message-ID: <CA+TH9Vmf_wzWsJKiQZJG1OiW3-ajOCw5ScyiMU6eCpFa8me9iw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

2015-03-19 10:34 GMT+01:00 Angelo Compagnucci <angelo.compagnucci@gmail.com>:
> Dear Thomas,
>
> 2015-03-19 10:16 GMT+01:00 Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com>:
>> Angelo,
>>
>> (Please don't use top-posting, top-posting is bad.)
>
> Sorry for the top post, it was a mistake.
>
>> On Thu, 19 Mar 2015 09:35:31 +0100, Angelo Compagnucci wrote:
>>
>>> The first on is the impossibility to prioritize patches to be
>>> reviewed. Nobody really cares to go to months old threads only to find
>>> an important patch passed unobserved. We should have a way to tag that
>>> patch as high/low priority just at the time of arrival, so reviewers
>>> could choose in a pool of important patches. This way the project
>>> could add important features and bug fixes more easily.
>>> To me, it's not that important that my new shiny sysdig package will
>>> enter buildroot in a couple of major releases, it's more important to
>>> have the makedevs recursive option applied cause it's really a killer
>>> feature (this is only an example from my backlog).
>>
>> Indeed, patchwork could offer more features to "classify" patches.
>> There are some big series like the SELinux stuff or the per-package
>> staging directory that are really "advanced/in-progress" work that
>> isn't at the same level as many other patches in the list.
>>
>> Patchwork is an open-source project, the code base is pretty small and
>> easy, so feel free to contribute improvements!
>
> Why not, I will try to take a look, I'm really acquainted to web
> programming with various web frameworks.

Thinking about this, we could add more states, something like
"advanced/in-progress" for packages with a good looking review, or
"New Package" for packages classified as new packages, or "High
priority" for very important patches. No changes require here, only a
couple of new states to add to the database.


Sincerely, Angelo.

-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
