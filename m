From: Tony Borras <tonyb@sysdev.org>
Date: Fri, 9 May 2008 20:48:14 -0800
Subject: [Buildroot] httpd question
In-Reply-To: <1CF6EDDF0820924DA43C9A52FE7325950B569C1A@MI8NYCMAIL17.Mi8.com>
References: <1CF6EDDF0820924DA43C9A52FE7325950B569C1A@MI8NYCMAIL17.Mi8.com>
Message-ID: <20080509204814.1151246e.tonyb@sysdev.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 9 May 2008 21:53:34 -0400
"hartleys" <hartleys@visionengravers.com> wrote:

> when I try to access the web interface I get
> the following message in my browser:
> 
> httpd: bind: Address already in use
> 
> For the life of me I can't figure out what might already be
> bound to port 80. Any ideas?

try:   nmap -p80 localhost

or instead of localhost the name or ip of your host.

TonyB

There are 10 types of people in this world, those that read
binary and those who don't!

--
  __      __  _     I N C.               http://www.sysdev.org
/ __|\\// __||  \  __   __          /         tonyb at sysdev.org
\__ \ \/\__ \||)|/ O_)\/ /        \/  System Tools / Utilities
|___/ || ___/|_ /\___|\_/        WIntel / Linux Device Drivers
