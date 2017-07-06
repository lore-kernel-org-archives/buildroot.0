From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 6 Jul 2017 21:31:36 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/linuxptp: fix coding style
 issue
In-Reply-To: <20170706210935.4204fd61@windsurf.lan>
References: <20170706174336.12294-1-romain.naour@smile.fr>
 <20170706210935.4204fd61@windsurf.lan>
Message-ID: <1223fd70-9088-5527-02a4-f128d2a3eb53@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 06/07/2017 ? 21:09, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Thu,  6 Jul 2017 19:43:35 +0200, Romain Naour wrote:
>> Thanks to Yann for the live review during the Buildroot summer camp.
>>
>> Signed-off-by: Romain Naour <romain.naour@smile.fr>
>> Cc: Petr Kulhavy <brain@jikos.cz>
>> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> ---
>>  package/linuxptp/linuxptp.mk | 17 ++++++++++++-----
>>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> I've applied both patches. However, the second patch created quite a
> bit of duplication between the build and install steps, so I committed
> an additional patch that creates and uses LINUXPTP_MAKE_ENV and
> LINUXPTP_MAKE_OPTS variables.

Indeed, thanks for fixing this.

Best regards,
Romain

> 
> Thanks!
> 
> Thomas
> 
