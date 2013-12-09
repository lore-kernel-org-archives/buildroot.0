From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 9 Dec 2013 15:47:14 +0100
Subject: [Buildroot] [PATCH 37/38] python-pysnmp-apps: new package
In-Reply-To: <OF3F4EB7E7.E0B9B2FB-ON86257C3C.0041FC8C-86257C3C.00439E5B@rockwellcollins.com>
References: <1386540907-7242-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1386540907-7242-38-git-send-email-thomas.petazzoni@free-electrons.com>
 <OF3F4EB7E7.E0B9B2FB-ON86257C3C.0041FC8C-86257C3C.00439E5B@rockwellcollins.com>
Message-ID: <CAAXf6LXgL5B=YE59+DQ_fpN38VFDW6OjjRGZJqFFZgXgWWow=A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 9, 2013 at 1:18 PM, Ryan Barnett
<rjbarnet@rockwellcollins.com> wrote:
> Thomas,
>
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 12/08/2013
> 04:15:06 PM:
>
> [...]
>
>> diff --git a/package/python-pysnmp-apps/Config.in
> b/package/python-pysnmp-apps/Config.in
>> new file mode 100644
>> index 0000000..0a1d98b
>> --- /dev/null
>> +++ b/package/python-pysnmp-apps/Config.in
>> @@ -0,0 +1,13 @@
>> +config BR2_PACKAGE_PYTHON_PYSNMP_APPS
>> +   bool "python-pysnmp-apps"
>> +   depends on BR2_PACKAGE_PYTHON
>> +   select BR2_PACKAGE_PYTHON_PYSNMP
>> +   depends on BR2_INSTALL_LIBSTDCPP # pysnmp -> pyasn
>> +   help
>> +     PySNMP MIBs is a set of IETF & IANA MIBs pre-compiled and
>> +     packaged to simplify their use with the PySNMP library.
>
> Looks like I have a copy and paste error. Please update the description to
> be the following:
>
> A collection of command-line tools for SNMP management purposes built on
> top of PySNMP package.

I'd either say 'on top of the PySNMP package' or 'on top of PySNMP'.

>
>> +
>> +     http://pysnmp.sf.net
>> +
>> +comment "python-pysnmp-apps needs toolchain w/ C++"

needs a toolchain
