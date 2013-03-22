From: Simon Dawson <spdawson@gmail.com>
Date: Fri, 22 Mar 2013 07:43:52 +0000
Subject: [Buildroot] [PATCH] czmq: new package
In-Reply-To: <CAAHaz6EahTVT7VWtSd02F16aLNyNJcpDc1vb6d9-Rsop2Rf5xA@mail.gmail.com>
References: <1363870885-27916-1-git-send-email-spdawson@gmail.com>
 <CAAHaz6EahTVT7VWtSd02F16aLNyNJcpDc1vb6d9-Rsop2Rf5xA@mail.gmail.com>
Message-ID: <CAHt8ZCMYmJYJ-2MquWVbFeffUKp9OgMQQw4WJnRhM7mg89GpOg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22 March 2013 06:06, Alexander Lukichev <alexander.lukichev@gmail.com> wrote:
>> +comment "czmq requires a toolchain with C++, LARGEFILE and WCHAR support"
>> +       depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 &&
>> BR2_LARGEFILE && BR2_USE_WCHAR)
>
> IPV6 is either omitted from the comment or falsely added to the condition.

Thanks for the feedback Alexander; will fix and resubmit.

Simon.
