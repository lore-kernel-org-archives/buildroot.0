From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 8 Sep 2015 14:55:19 +0100
Subject: [Buildroot] [PATCH] gdb: prevent building the documentation
In-Reply-To: <CA+BsyQ5JB0zTo0DXkgYTQAXox-ZuYjntwwLaAWABz0dGR_Z_2Q@mail.gmail.com>
References: <1441718565-24492-1-git-send-email-Vincent.Riera@imgtec.com>	<55EEE52F.4020904@mind.be>	<CA+BsyQ6edT36JYL7nJCfv1ZChbrO-Z9t8RWQ4kXmZ8ypqy4FAg@mail.gmail.com>
 <CA+BsyQ5JB0zTo0DXkgYTQAXox-ZuYjntwwLaAWABz0dGR_Z_2Q@mail.gmail.com>
Message-ID: <55EEE8C7.2020706@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Brendan Heading,

On 09/08/2015 02:53 PM, Brendan Heading wrote:
>> I was looking at this in parallel and was about to start looking at
>> adding a host-texinfo package (which includes makeinfo).
> 
> Stop press. There is already a host-texinfo package, and making
> host-gdb dependent on it fixes this build problem. Just running a few
> tests at the moment.
> 
> I think this is a cleaner and better way to solve this one ...

yes, it is. Please complete your tests and feel free to submit a patch.
When you do it, I will test it and mark mine as superseded.

Thanks,

Vincent.

> regards
> 
> Brendan
> 
