From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 28 Apr 2018 07:15:01 +0200
Subject: [Buildroot] [PATCH v2 5/5] python-flask-bootstrap: new package
In-Reply-To: <20180427233344.56c57c66@windsurf>
References: <20180206132506.30389-1-aduskett@gmail.com>
 <20180206132506.30389-5-aduskett@gmail.com>
 <20180427233344.56c57c66@windsurf>
Message-ID: <CAGm1_ksX5tTpYNsv8yTRKUAsw6e0NfFBDpv+xeqzvjSPyWTx8A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Apr 27, 2018 at 11:33 PM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> On Tue,  6 Feb 2018 08:25:06 -0500, Adam Duskett wrote:
>> Flask-Bootstrap packages Bootstrap into an extension that mostly consists of a
>> blueprint named 'bootstrap'. It can also create links to serve Bootstrap from
>> a CDN and works with no boilerplate code in your application.
>>
>> Signed-off-by: Adam Duskett <aduskett@gmail.com>
>
> This package has a bunch of check-package warnings:
>
> package/python-flask-bootstrap/Config.in:2: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
> package/python-flask-bootstrap/Config.in:3: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
> package/python-flask-bootstrap/Config.in:4: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
> package/python-flask-bootstrap/Config.in:5: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
> package/python-flask-bootstrap/Config.in:6: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
> package/python-flask-bootstrap/Config.in:7: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
> package/python-flask-bootstrap/Config.in:8: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
> package/python-flask-bootstrap/Config.in:9: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
> package/python-flask-bootstrap/Config.in:10: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
>
> I had fixed them locally, but then I had another question.
>
>> +PYTHON_FLASK_BOOTSTRAP_LICENSE = BSD-3c
>
> How did you determine it was BSD-3c ? Originally you had just BSD
> (which isn't specific enough) and Yegor said it's BSD-3c, but I
> couldn't find where this information was coming from.
>
> Yegor ?

I've looked at this file
https://github.com/mbr/flask-bootstrap/blob/master/LICENSE

The author also mentions Apache-2.0 license as the license of the
original project.

Yegor
