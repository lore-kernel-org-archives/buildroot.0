From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 May 2016 23:03:42 +0200
Subject: [Buildroot] [PATCH v2 0/8] php: bump version to 7.0.5
In-Reply-To: <1460980391-65336-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1460980391-65336-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160501230342.5ac8d28d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Apr 2016 12:53:03 +0100, Vicente Olivert Riera wrote:

> Vicente Olivert Riera (8):
>   php-geoip: bump version to HEAD of master on GitHub
>   php-imagick: bump version to 3.4.1
>   php-zmq: bump version to 1.1.3

I've applied those ones, since they continue to work with PHP 5.

>   php: bump version to 7.0.5
>   php-gnupg: re add package, now compatible with PHP 7
>   php-memcached: re add package, now compatible with PHP 7
>   php-ssh2: re add package, now compatible with PHP 7
>   php-yaml: re add package, now compatible with PHP 7

I'm holding off on the PHP 7 update. PHP 7 is quite new, it breaks some
external modules, so I think we should apply since after 2016.05 is
released.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
