From: Esben Haabendal <esben@geanix.com>
Date: Mon, 16 Sep 2019 19:15:28 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/python-kiwisolver: new
 package
In-Reply-To: <CAGm1_kvVBA6pvEQ7MDsJz7xmCu-kwYD=Hs1gO4BUazDfBnuWOw@mail.gmail.com>
 (Yegor Yefremov's message of "Mon, 16 Sep 2019 18:17:52 +0200")
References: <20190916121350.2796-1-esben@geanix.com>
 <20190916133105.8437-1-esben@geanix.com>
 <CAGm1_kvVBA6pvEQ7MDsJz7xmCu-kwYD=Hs1gO4BUazDfBnuWOw@mail.gmail.com>
Message-ID: <87y2yo40y7.fsf@geanix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor Yefremov <yegorslists@googlemail.com> writes:

>> diff --git a/package/python-kiwisolver/Config.in b/package/python-kiwisolver/Config.in
>> new file mode 100644
>> index 000000000000..d3ce857bac2f
>> --- /dev/null
>> +++ b/package/python-kiwisolver/Config.in
>> @@ -0,0 +1,17 @@
>> +config BR2_PACKAGE_PYTHON_KIWISOLVER
>> +       bool "python-kiwisolver"
>> +       depends on BR2_INSTALL_LIBSTDCPP
>> +       depends on BR2_PACKAGE_PYTHON3
>
> Basically the patch looks good. But setup.py says both Py2 and Py3 are
> supported.

I will try and see if it builds for python 2 also.

> Other than that you can add my
>
> Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
>
> for the next version.
>
> Yegor

/Esben
