From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 15 Mar 2012 18:11:52 -0300
Subject: [Buildroot] [PATCH 19/20] alsa-lib: bump to version 1.0.25
In-Reply-To: <20120315220538.678c740b@skate>
References: <1331502489-5036-1-git-send-email-gustavo@zacarias.com.ar>
 <1331502489-5036-19-git-send-email-gustavo@zacarias.com.ar>
 <201203140036.06296.arnout@mind.be> <20120315213041.3bda3650@skate>
 <702f6e09c17e9a072c3e4458c35a83a2@zacarias.com.ar>
 <20120315220538.678c740b@skate>
Message-ID: <c0b039e1e021d503d0294c6b983432d2@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-03-15 18:05, Thomas Petazzoni wrote:

> Le Thu, 15 Mar 2012 17:51:42 -0300,
> Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :
>
>> Because it doesn't build with both static & shared set starting with
>> version 1.0.25, the configure script just errors out complaining 
>> about
>> some libtool issues about building both.
>
> Ok, thanks. This is odd, is it a new libtool behaviour?
>
> Thomas

I don't think so, they're still using libtool 1.5.22 for alsa-lib so i 
guess it's an old/new problem that they're not fixing by upgrading to 
libtool 2.x.
Regards.
