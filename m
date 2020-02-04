From: Christian Stewart <christian@paral.in>
Date: Tue, 04 Feb 2020 15:02:04 -0800
Subject: [Buildroot] [PATCH 1/2] package/docker-containerd: bump to 1.3.2
In-Reply-To: <CA+h8R2puYbJDhqUzYzxfyqV9DzBPwHDyUgxa42y5QFoUT=QrRw@mail.gmail.com>
References: <20200110045033.1920685-1-christian@paral.in>
 <87pnfrg0x6.fsf@dell.be.48ers.dk>
 <CA+h8R2puYbJDhqUzYzxfyqV9DzBPwHDyUgxa42y5QFoUT=QrRw@mail.gmail.com>
Message-ID: <874kw6gdn7.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter, all,

Christian Stewart <christian@paral.in> writes:
>> Can you provide a more detailed commit message, please?
>>
>> In the past we have matched the runc and containerd versions with what
>> upstream uses for docker-ce.
>>
>> What does this bring when used with docker-engine 19.03? Is it
>> compatible?

While this release (1.3.x) is compatible with Docker and containerd is a
separate project now (and could be updated as releases are published,
independently from Docker);

Docker 19.03.4 bumped their containerd reference to 1.2.10. Containerd
has released a 1.2.12 release (on the 1.2.x as opposed to 1.3.x series)
with bugfixes.

For now, I will withdraw this patch and re-submit one to bump to 1.2.12.

Best regards,
Christian
