From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 30 Jul 2014 23:39:02 -0300
Subject: [Buildroot] configure HOSTAPD build to enable nl80211 driver
 support
In-Reply-To: <CABzetm3JrRH7f4R8ErDqd96XKUBEH=9ARqsQdm86UDfU89D4aw@mail.gmail.com>
References: <CABzetm3JrRH7f4R8ErDqd96XKUBEH=9ARqsQdm86UDfU89D4aw@mail.gmail.com>
Message-ID: <53D9AC46.9000704@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/30/2014 10:48 PM, Rohit Kumar wrote:

> Hello,
> 
> how can i configure hostapd build with nl80211 driver support.
> currenty when i run hostapd, it says
>>nl80211 driver initialization failed.
> With Regards,

Hi.
That error message is terribly generic, how about a little more
information on what hostapd says before that and your hostapd config?
A dump of the wlan card information would be useful too, typically via
the iw package "iw phy0 info" since it's possible you're trying to do
master mode on a device that doesn't support it.
Regards.
