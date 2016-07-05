From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 5 Jul 2016 17:46:30 +0200
Subject: [Buildroot] [PATCH] apply-patches: catch unexpected failure
In-Reply-To: <20160705174328.0366d798@free-electrons.com>
References: <1467716529-30183-1-git-send-email-romain.naour@gmail.com>
 <20160705174328.0366d798@free-electrons.com>
Message-ID: <6d827ad9-5d11-f7a9-006f-172da07837bd@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Le 05/07/2016 ? 17:43, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Tue,  5 Jul 2016 13:02:09 +0200, Romain Naour wrote:
>> As reported by S?bastien Szymanski [1], the apply-patches script
>> doesn't stop if a tar command can't extract an archive.
>>
>> Use "set -e" to exit immediately if a command return an error.
>>
>> [1] http://patchwork.ozlabs.org/patch/626196
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> Cc: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
>> ---
>>  support/scripts/apply-patches.sh | 3 +++
>>  1 file changed, 3 insertions(+)
> 
> In fact, this broke many packages, so I reverted.

Ok, sorry about that :-/

Romain

> 
> Thomas
> 
