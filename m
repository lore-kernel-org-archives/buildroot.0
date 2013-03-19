From: Simon Dawson <spdawson@gmail.com>
Date: Tue, 19 Mar 2013 07:27:40 +0000
Subject: [Buildroot] [PATCH] zeromq: add C++ bindings
In-Reply-To: <CAAHaz6E+7jgzJVcS4YXMEF=05yVsY5d-o=dxS0NFD5UOhptjUg@mail.gmail.com>
References: <1363618617-2969-1-git-send-email-spdawson@gmail.com>
 <CAAHaz6E+7jgzJVcS4YXMEF=05yVsY5d-o=dxS0NFD5UOhptjUg@mail.gmail.com>
Message-ID: <CAHt8ZCMhLTynWnG1b=Q-zPGGpDEAeVNsEnOZcyr0ZxcovZcRLQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexander,

On 19 March 2013 05:42, Alexander Lukichev <alexander.lukichev@gmail.com> wrote:
>> +comment "zeromq requires a toolchain with LARGEFILE and WCHAR support"
>> +       depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
>
> Doesn't zeromq 3.2.x also require BR2_INET_IPV6, like you posted earlier?

Yes, you're quite right; but this patch has been superseded now.

Simon.
