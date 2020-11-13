From: Julien Olivain <ju.o@free.fr>
Date: Fri, 13 Nov 2020 12:56:52 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/linux-backports: bump
 version to 5.8
In-Reply-To: <MW3PR11MB476417BF2CC5E2E72CA4AE36E9E60@MW3PR11MB4764.namprd11.prod.outlook.com>
References: <20201111162208.362275-1-ju.o@free.fr>
 <20201112120155.333290-1-ju.o@free.fr>
 <20201112120155.333290-2-ju.o@free.fr> <20201112210103.GB60815@pevik>
 <20201112211713.GD771438@scaer> <20201112212427.GA68372@pevik>
 <MW3PR11MB476417BF2CC5E2E72CA4AE36E9E60@MW3PR11MB4764.namprd11.prod.outlook.com>
Message-ID: <22e1edb051077d2303305919ad01fa91@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Johannes, All,

On 13/11/2020 08:18, Berg, Johannes wrote:
>> Unless using mac80211, which require v3.10 current backports still 
>> support
>> kernel v3.0 right?
> 
> Not really. While we haven't actively _removed_ things, we no longer 
> test them.
> 
> In any case, backports basically only supports WiFi these days anyway,
> so what would the point be?

In that case, I will send an updated patch that will raise the minimal 
kernel
version requirement to 3.10.

Thanks!

Julien.
