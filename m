From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 9 Dec 2015 14:21:22 +0000
Subject: [Buildroot] [PATCH v2 2/3] python-pexpect: new package
In-Reply-To: <CAGm1_kuj=i5Z4uY92oM4-PH7kcnSK1PeYSHFQedUh3KGzdWNzA@mail.gmail.com>
References: <1446203156-26848-1-git-send-email-viktorin@rehivetech.com>
 <1449670313-3613-1-git-send-email-viktorin@rehivetech.com>
 <1449670313-3613-3-git-send-email-viktorin@rehivetech.com>
 <CAGm1_kuj=i5Z4uY92oM4-PH7kcnSK1PeYSHFQedUh3KGzdWNzA@mail.gmail.com>
Message-ID: <566838E2.4020401@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yegor and Jan,

On 09/12/15 14:18, Yegor Yefremov wrote:
>> diff --git a/package/python-pexpect/Config.in b/package/python-pexpect/Config.in
>> new file mode 100644
>> index 0000000..a42aec7
>> --- /dev/null
>> +++ b/package/python-pexpect/Config.in
>> @@ -0,0 +1,10 @@
>> +config BR2_PACKAGE_PYTHON_PEXPECT
>> +       bool "python-pexpect"
>> +       depends on BR2_PACKAGE_PYTHON
> 
> remove BR2_PACKAGE_PYTHON dependency
> 
>> +       select BR2_PACKAGE_PYTHON_PTYPROCESS
>> +       help
>> +         Pexpect is a pure Python module for spawning child applications; controlling them; and responding to
>> +         expected patterns in their output. Pexpect works like Don Libes? Expect. Pexpect allows your script
>> +         to spawn a child application and control it as if a human were typing commands.
> 
> Lines must be max. 80 characters long

72.

Regards,

Vincent.
