From: prafulla_kota <prafulla.kota@broadcom.com>
Date: Thu, 31 Jul 2014 00:47:34 -0700 (PDT)
Subject: [Buildroot] backtrace() not working on ARMv7a
In-Reply-To: <20140731083943.49d4b0db@free-electrons.com>
References: <1406788255956-76350.post@n4.nabble.com>
 <20140731083943.49d4b0db@free-electrons.com>
Message-ID: <1406792854426-76360.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, 

Thanks for quick reply and i have attached the .config file. 

We have applied below patch in ulibc and it worked fine for below
requirement and we do have requirement on GLIBC as well and requesting the
same here. 

Thanks, 
Prafulla kota

buildroot_dot_config.buildroot_dot_config
<http://buildroot-busybox.2317881.n4.nabble.com/file/n76360/buildroot_dot_config.buildroot_dot_config>  



--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/backtrace-not-working-on-ARMv7a-tp76350p76360.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
