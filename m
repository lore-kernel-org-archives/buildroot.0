From: Simon Dawson <spdawson@gmail.com>
Date: Tue, 20 Aug 2013 12:02:49 +0100
Subject: [Buildroot] [PATCH 1/1] gcc: fix libstdc++_pic for AVR32
In-Reply-To: <CAAHaz6H5BTFV5t5FUNGmM5EVNdQziSQzifFmdZbmcrgdiV4qCQ@mail.gmail.com>
References: <1376025370-9467-1-git-send-email-alexander.lukichev@gmail.com>
 <20130810210616.51dbcbf9@skate>
 <CAHt8ZCPX1TOFRPZHVjLtt3ScTL=2vc7oYwj0u9pPd3N8mSTVsg@mail.gmail.com>
 <CAAHaz6H5BTFV5t5FUNGmM5EVNdQziSQzifFmdZbmcrgdiV4qCQ@mail.gmail.com>
Message-ID: <CAHt8ZCPYaYwBw2kzQKGqqA_CWk0T=6KwyqwPGzB0O43U5OLfog@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12 August 2013 08:21, Alexander Lukichev
<alexander.lukichev@gmail.com> wrote:
>   Without this fix the GCC fails to build with C++ support always, at least
> on my host machine ('gcc (GCC) 4.5.1 20100924 (Red Hat 4.5.1-4)', binutils
> 2.20.51.0.7-8.fc14). The fix solves the problem.

This works for me too, hence:

Acked-by: Simon Dawson <spdawson@gmail.com>
Tested-by: Simon Dawson <spdawson@gmail.com>
