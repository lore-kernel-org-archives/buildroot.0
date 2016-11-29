From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 29 Nov 2016 14:23:30 +0000
Subject: [Buildroot] [PATCH next 1/2] readline: bump version to 7.0
In-Reply-To: <ad5265b4-b952-7fd3-fd40-fe562ce2150f@imgtec.com>
References: <20161129122404.59676-1-Vincent.Riera@imgtec.com>
 <20161129133705.1ead6568@free-electrons.com>
 <ad5265b4-b952-7fd3-fd40-fe562ce2150f@imgtec.com>
Message-ID: <e1d91981-404b-45c5-baae-c56b9064260b@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 29/11/16 12:56, Vicente Olivert Riera wrote:
> Hi Thomas,
> 
> On 29/11/16 12:37, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Tue, 29 Nov 2016 12:24:03 +0000, Vicente Olivert Riera wrote:
>>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>>
>> Did you do a bit of build testing of the readline reverse dependencies,
>> just to check there is no obvious regression caused by possible API
>> changes?
> 
> no, just bash-4.4.

I have tested the new version of readline with this reverse dependencies:

gnuchess
python-readline
php-ext-readline
sqlite
chrony
socat
connman-client
xorriso
quagga-vtysh
wpa_supplicant
gawk
gnupg2
dropwatch
atftp
nftables
postgresql
lftp
softether
neardal
libnfc-examples
ipmitool-ipmishell
gnuplot
lvm2
lua-readline
bind
ruby
mysql
bash
slang
util-linux
parted
unixodbc
jack2

All of them built fine.

Regards,

Vincent

> 
> Vincent
> 
>> Thanks,
>>
>> Thomas
>>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
