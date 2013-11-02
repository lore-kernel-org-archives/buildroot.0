From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 02 Nov 2013 16:52:50 +0100
Subject: [Buildroot] [PATCH 1/1] libcap: fix static linking issue
In-Reply-To: <20131101184824.52140c8c@skate>
References: <5251C3B0.7090105@openwide.fr> <20131101184824.52140c8c@skate>
Message-ID: <52751FD2.4080501@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 01/11/2013 18:48, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
>
> On Sun, 06 Oct 2013 22:10:24 +0200, Romain Naour wrote:
>> Add -fPIC flag
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/619bceb3491ecd2ed4e1ae552fdb237a0ed2fa47/
>>
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> I've just sent a patch which I believe is a better fix than this one.
> The problem was that libcap was building the shared library
> unconditionally. By adjusting the libcap build system, we can make it
> build only the static library, and therefore make things work properly.
>
> Best regards,
>
> Thomas
Hi Thomas,

I haven't take time to rework on this path :-/
Thanks.

Best regards,
Romain
