From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 7 Nov 2013 09:27:27 +0100
Subject: [Buildroot] [PATCH v3 1/1] Avoid toolchain download when it is
	preinstalled
In-Reply-To: <20131107085714.0046eb1e@skate>
References: <527A962E.4090402@gezedo.com>
	<20131107085714.0046eb1e@skate>
Message-ID: <CAAXf6LUO7apoOryTOU76EN5r+rXhVH-SwqE4PHJZLymGnMeqdg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 7, 2013 at 8:57 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Laurent GONZALEZ,
>
> On Wed, 06 Nov 2013 20:19:10 +0100, Laurent GONZALEZ wrote:
>> For configurations using a toolchain that is preinstalled on
>> the host, <pkg>_SITE and <pkg>_SOURCE variables must be kept
>> empty to avoid downloading any toolchain package.
>> The actual implementation has been proposed by Thomas Petazzoni.
>>
>> Signed-off-by: GONZALEZ Laurent <br2@gezedo.com>
>> ---
>>  toolchain/toolchain-external/toolchain-external.mk |    8 ++++++++
>>  1 file changed, 8 insertions(+)
>
> Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
