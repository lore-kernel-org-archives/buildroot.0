From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Mar 2021 21:21:48 +0100
Subject: [Buildroot] [git commit] package/python-pyyaml: security bump
 to version 5.4.1
In-Reply-To: <20210302202639.36CF986A88@busybox.osuosl.org> (Yann E. MORIN's
 message of "Tue, 2 Mar 2021 21:49:10 +0100")
References: <20210302202639.36CF986A88@busybox.osuosl.org>
Message-ID: <87k0q932qr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit:
 > https://git.buildroot.net/buildroot/commit/?id=de43a9775d4646035b18eb5737e5fa4cd2eeedea
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Fix CVE-2020-14343: A vulnerability was discovered in the PyYAML library
 > in versions before 5.4, where it is susceptible to arbitrary code
 > execution when it processes untrusted YAML files through the full_load
 > method or with the FullLoader loader. Applications that use the library
 > to process untrusted input may be vulnerable to this flaw. This flaw
 > allows an attacker to execute arbitrary code on the system by abusing
 > the python/object/new constructor. This flaw is due to an incomplete fix
 > for CVE-2020-1747.

 > Update hash of LICENSE file (update in year:
 > https://github.com/yaml/pyyaml/commit/58d0cb7ee09954c67fabfbd714c5673b03e7a9e1)

 > https://github.com/yaml/pyyaml/blob/5.4.1/CHANGES

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
