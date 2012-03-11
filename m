From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 11 Mar 2012 20:23:44 -0300
Subject: [Buildroot] gettext versions besides 0.16.1
In-Reply-To: <CAGmOteMVn2TCkE5tnAw+oBEM75gcJNwuBVdLkrsfr5Jeqzf1ZQ@mail.gmail.com>
References: <CAGmOteMVn2TCkE5tnAw+oBEM75gcJNwuBVdLkrsfr5Jeqzf1ZQ@mail.gmail.com>
Message-ID: <07d127d18c9254b6e24dc8624a973556@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-03-11 03:45, PHilip RUshik wrote:

> I have tried on a few occasions to get buildroot to build newer
> versions of gnu gettext, but it seems that only 0.16.1 will work 
> (with
> uClibc). Is anyone planning on working on making newer versions of
> gettext work?
> To be honest, my projects do not depend on newer versions of gettext,
> so 0.16.1 is fine with me, Im not even sure about what changes were
> made in newer versions, Im just concerned because building gettext is
> so fragile.
>
> ---PHil

Hi.
I'm working in converting gettext to a modern autotargets package.
If things pan out well i'll bump it to a modern version as well, which 
from early testing won't be a problem.
It'll take a couple of days to iron it out though so i can send a clean 
patch.
Regards.
