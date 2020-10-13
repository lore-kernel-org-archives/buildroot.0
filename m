From: Michael Nosthoff <buildroot@heine.tech>
Date: Tue, 13 Oct 2020 17:40:19 +0200
Subject: [Buildroot] [PATCH] systemd: add option to enable
 systemd-journal-remote
In-Reply-To: <20201013173524.56b78792@windsurf>
References: <CAJPHfYNGkrW8MWGQyaWgehg_wAQ=3eoNWVZHEh=DyhbebJhJTA@mail.gmail.com>
 <905ca80c-acb2-3118-f829-baeb175e4a6a@heine.tech>
 <20201013173524.56b78792@windsurf>
Message-ID: <2fe4a385-5157-bbb0-2cb7-f9af26881b44@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
>> I hope that wasn't to confusing. What do you think?
> 
> I agree the first option you're proposing looks simpler. How big are
> each of those tools? Unless one is really really big and unnecessary in
> some scenarios, I think your proposed option is straightforward and
> would solve the problem.
> 

# ls -la /usr/lib/systemd/systemd-journal-*
-rwxr-xr-x 1 root root  25964 Oct 13 14:57
/usr/lib/systemd/systemd-journal-gatewayd
-rwxr-xr-x 1 root root  46508 Oct 13 14:57
/usr/lib/systemd/systemd-journal-remote
-rwxr-xr-x 1 root root  34144 Oct 13 14:57
/usr/lib/systemd/systemd-journal-upload


So I would write this up in a patch and submit it. Trickiest part will
be the description I think.


Regards,
Michael
