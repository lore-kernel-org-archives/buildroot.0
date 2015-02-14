From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 14 Feb 2015 12:38:34 +0100
Subject: [Buildroot] [PATCH 2/3] package/openvmtools: fix syncDriverPosix
In-Reply-To: <20150214092058.1269ba68@free-electrons.com>
References: <1423437730-22997-1-git-send-email-romain.naour@openwide.fr>	<1423437730-22997-2-git-send-email-romain.naour@openwide.fr>
 <20150214092058.1269ba68@free-electrons.com>
Message-ID: <54DF33BA.3090008@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 14/02/2015 09:20, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
> 
> On Mon,  9 Feb 2015 00:22:09 +0100, Romain Naour wrote:
>> Backport a patch from Fedora
>>
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>> ---
>>  package/openvmtools/0007-sizeof_argument.patch | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>  create mode 100644 package/openvmtools/0007-sizeof_argument.patch
> 
> Applied to master, thanks.
> 
> Note that Debian also has a collection of patches on open-vm-tools, and
> at least two of them seem to fix security related issues. Is this stuff
> still maintained upstream? They have apparently moved their development
> to github, at https://github.com/vmware/open-vm-tools.
> 

Indeed, I've cloned this repository to check if the Fedora patches were merged.
It seems that it is still maintained, but not on regular basis.

I think the two patches from Debian needs further testing...
Karoly can you review those patches ?

In the meantime, I'll try to have some time next week to test this package with
our VWware image at work.

> Can you check if those patches were merged here already?

Not yet, the last commit has been merged the 28/10/2014.

Best regards,
Romain

> 
> Thanks!
> 
> Thomas
> 
