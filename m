From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 6 Dec 2019 00:35:43 +0100
Subject: [Buildroot] [PATCH 2/2] support/testing: add python-django test
In-Reply-To: <20191204200629.686191-2-aduskett@gmail.com>
References: <20191204200629.686191-1-aduskett@gmail.com>
 <20191204200629.686191-2-aduskett@gmail.com>
Message-ID: <5fda2de1-b030-563e-f4b3-cf9b121a118b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/12/2019 21:06, aduskett at gmail.com wrote:
> +        _, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, 0)
> +

 flake8 complained about a missing empty line here, so I pushed a fixup commit.

 Please run flake8 before submitting :-)

 Regards,
 Arnout

> +class TestPythonPy3Django(TestPythonDjango):
> +    __test__ = True
> +    config = TestPythonDjango.config + \
> +        """
