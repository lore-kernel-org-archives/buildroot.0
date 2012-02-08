From: Poole, Donald R. <drpoole@swri.org>
Date: Wed, 8 Feb 2012 06:28:53 +0000
Subject: [Buildroot] FW: Buildroot RFS Login Question
In-Reply-To: <CAHXCMM+Y-gHrkSCuZVmDkDNqLKqkdGCfmXVj=xuA-o9wPsEjew@mail.gmail.com>
Message-ID: <CB5771EE.2EBB%donald.poole@swri.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2/7/12 2:51 AM, "Samuel Martin" <s.martin49@gmail.com> wrote:


>Hi,
>
>> Unfortunately, if I use the root user get a "Login Incorrect" message
>>and a
>> new login prompt that looks like this:
>> Starting input-event-daemon: done
>>
>> Welcome to VICTORY Embedded
>> victory-embedded login: root
>> Login incorrect
>>
>> victory-embedded login:
>>
>
>It may be stupid, but could you check that /etc/passwd and /etc/shadow
>are valid in the rootfs.
>I did spend some time debugging rootfs with a valid /etc/passwd and
>empty /etc/shadow whereas it should not.
>
>
>Sam

Sam, I took a look at my /etc/passwd and /etc/shadow in my rootfs and each
file is populated, but how do I know if they are valid?
