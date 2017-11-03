From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 3 Nov 2017 12:17:37 +0100
Subject: [Buildroot] Analysis of build results for 2017-10-30
In-Reply-To: <20171102232155.11995715@windsurf>
References: <20171031070013.AD75D207B2@mail.free-electrons.com>
 <20171031230519.3feb2619@windsurf> <20171102232155.11995715@windsurf>
Message-ID: <CA+TH9Vkq1oPHSwTTJTzr4MdVRo6=zWMgG5pLKTsf3-ZAwhNKjw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
>>
>> >          arm |            host-mono-5.2.0.224 | NOK | http://autobuild.buildroot.net/results/51dcf8908157393a09ce772e6099e73fd0cd0ba2 |
>>
>> Unhandled Exception:
>> System.ExecutionEngineException: System.NullReferenceException: Object reference not set to an instance of an object ---> System.NullReferenceException: Object reference not set to an instance of an object
>>
>> Angelo, could you have a look ?
>
> Still unfixed.

Unfortunately I cannot reproduce the problem. Could be something
transient? It has not crashed anymore in the last few days.

I'm preparing the bump of the package btw.
