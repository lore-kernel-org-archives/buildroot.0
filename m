From: Anton Leontiev <scileont@gmail.com>
Date: Wed, 28 Apr 2021 10:10:46 +0300
Subject: [Buildroot] [PATCH] docs/manual: document KBUILD_VERBOSE
 environment variable
In-Reply-To: <87r1ivc57v.fsf@dell.be.48ers.dk>
References: <20210419160346.6393-1-scileont@gmail.com>
 <20210427195118.GA2137340@scaer>
 <CAPbbKZbyv=myTw1huROwV9MnGB4gSuKuq5NBS6tv4M+oT09oJQ@mail.gmail.com>
 <87r1ivc57v.fsf@dell.be.48ers.dk>
Message-ID: <CAPbbKZaFPkGc+1+R5jhWEruUOhGNKm8-+B9uuuvW+_bTQMu7EQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard <peter@korsgaard.com>:
>> Then maybe it's better to rename this variable into something like
>> BR2_VERBOSE?
>
> Perhaps. What is your use case for wanting to use an environment
> variable instead of the normal V=1 make argument?

I have a Jenkins job, which builds Buildroot. I want to add a job
parameter to enable verbose output. Jenkins job parameters are
automatically exposed as environment variables. So I've named it
KBUILD_VERBOSE and that's all, I shouldn't change any commands.

-- 
Anton Leontiev
