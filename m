From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 31 Oct 2014 06:59:07 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-10-30
In-Reply-To: <20141031095318.GB2453@tarshish>
References: <20141031073016.162E2100B71@stock.ovh.net>
 <20141031095318.GB2453@tarshish>
Message-ID: <54535D6B.30102@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/31/2014 06:53 AM, Baruch Siach wrote:

> sed -r -i -e 's/^(hosts:[[:space:]]+).*/\1files mdns4_minimal [NOTFOUND=return] dns mdns4/' /home/buildroot/instance-1/output/target/etc/nsswitch.conf
> sed: can't read /home/buildroot/instance-1/output/target/etc/nsswitch.conf: No such file or directory
> 
> This is caused by e1eba3d97c5d4 (system/skeleton: make nsswitch install 
> conditional). nss-mdns expect nsswitch.conf to exist when it builds, while 
> this commit postpones nsswitch.conf installation to target_finalize. Not sure 
> what to do with that, though. Move it to an earlier hook?

Hi.
I'll try to finish cooking up the basefiles package between
today/tomororw, didn't want to rush it but there seems to a be a need
for it now.
Regards.
