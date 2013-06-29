From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 29 Jun 2013 09:31:21 -0300
Subject: [Buildroot] [PATCH] dhcpcd: unavailable for bfin and fix
 another bug
In-Reply-To: <20130629125530.412858a5@skate>
References: <1372463785-29537-1-git-send-email-gustavo@zacarias.com.ar>
 <20130629104251.4697be00@skate> <51CEBC51.9030601@zacarias.com.ar>
 <20130629125530.412858a5@skate>
Message-ID: <51CED399.8050408@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/29/2013 07:55 AM, Thomas Petazzoni wrote:

>> (all defaults except +IPV6 for dhcpcd).
>> And 2012R1-RC2 fails to download properly (2012R2-RC2 too for that
>> matter but i've got a local copy).
>> I kind of doubt that 2012R1 being older has getifaddrs enabled though.
> 
> Yes, one recent patch to the download infrastructure broke this. I
> should sent a different e-mail with this.

Downloaded manually and as i supposed, it lacks getifaddrs too.
Regards.
