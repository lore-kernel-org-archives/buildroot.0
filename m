From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 27 Apr 2016 07:41:41 -0300
Subject: [Buildroot] [PATCH 1/2] ruby: bump version to 2.3.1
In-Reply-To: <1461752709-37272-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1461752709-37272-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <57209765.8070904@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/04/16 07:25, Vicente Olivert Riera wrote:

> -RUBY_VERSION_EXT = 2.3.0
> +RUBY_VERSION = $(RUBY_VERSION_MAJOR).1
> +RUBY_VERSION_EXT = 2.3.1

Hi Vicente.
Oops? You shouldn't update RUBY_VERSION_EXT that lightly since it only 
changes among major bumps.
Regards.
