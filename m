From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Thu, 6 Sep 2018 15:58:02 -0700
Subject: [Buildroot] [PATCH v2 1/1] qemu: add support for python3
In-Reply-To: <20180906095048.44a886a1@windsurf>
References: <20180904183934.12291-1-aduskett@gmail.com>
 <87efe9cd6u.fsf@tkos.co.il>
 <CAFSsvmo00eY8yv5PmPQ31KJGprg4HSpM6mqB-hs=8Xn_r1Gz7w@mail.gmail.com>
 <20180905035954.7sio4o56gviyyb5a@sapphire.tkos.co.il>
 <CAFSsvmqufw-w8+ywf0McNBq=kvLqR+-0qPvA-oP726CvWFe+CA@mail.gmail.com>
 <87bm9bdeg3.fsf@tkos.co.il> <20180906095048.44a886a1@windsurf>
Message-ID: <354417af-ed01-5442-82eb-298ebb828872@mentor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/06/2018 12:50 AM, Thomas Petazzoni wrote:
> Hello,
>
> +Hollis, Matt.
>
> On Wed, 05 Sep 2018 20:47:08 +0300, Baruch Siach wrote:
>
>> Adam Duskett writes:
>>> How would I test this? I am used to having BuildRoot handle the paths
>>> for such dependencies.
>> Just send RFC patch that you tested on your host with whatever Python
>> version you have installed. There are a number of participants in this
>> list that have access to hosts running RHEL6 or its derivatives.
> It would actually be useful if Hollis (or Matt ?) could provide a
> Docker container to easily access a RHEL6.5 system, so that people can
> try out what happens on such an old system. I guess RHEL6.5 itself is
> not easy to access because it's only for Redhat customers, but perhaps
> there is an equivalent version of CentOS that would do the job ?
>
> https://hub.docker.com/_/centos/ has a CentOS 6.6 docker image, but not
> CentOS 6.5. However, CentOS 6.6 also has Python 2.6 by default:
>
> $ sudo docker run -i -t centos:6.6 /bin/bash
> [...]
> [root at f7e0f2f6d7af /]# python
> Python 2.6.6 (r266:84292, Jan 22 2014, 09:42:36)
> [GCC 4.4.7 20120313 (Red Hat 4.4.7-4)] on linux2
> Type "help", "copyright", "credits" or "license" for more information.

Right, I can't distribute any Docker images.

I'm sure there are some differences from 6.5, but CentOS 6.6 would be a 
good testing ground.

Hollis Blanchard
Mentor Graphics Emulation Division
