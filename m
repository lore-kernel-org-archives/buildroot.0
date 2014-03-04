From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 4 Mar 2014 10:34:41 +0100
Subject: [Buildroot] [PATCH 2/2] boost: make build with python an option
In-Reply-To: <20140304095413.5a37b51d@skate>
References: <E1CF8EFE2042404B87DE2B6D662128020ED58B9D@KUUMEX10.barco.com>
 <20140304095413.5a37b51d@skate>
Message-ID: <CAHXCMM+PsDptX+rAKzm-XDVV0bU7L=D1WMXG-7f=c-ydY8_Gzg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 4, 2014 at 9:54 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Derycke, Johan,
>
> On Tue, 4 Mar 2014 08:32:56 +0000, Derycke, Johan wrote:
>
>> +config BR2_PACKAGE_BOOST_PYTHON
>> +       depends on BR2_PACKAGE_PYTHON
>> +       bool "boost-python"
>
> Just to confirm, boost-python only works with Python 2.x, and not
> Python 3.x ?

You can have boost-python for both python2 and python3.

Regards,

-- 
Samuel
