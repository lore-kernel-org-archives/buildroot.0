From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 14 Jun 2018 16:59:04 +0530
Subject: [Buildroot] [PATCH 1/1] buildroot Added Banana Pi M2 Ultra
 platform
In-Reply-To: <BN6PR11MB131514FF11A325A511480816927D0@BN6PR11MB1315.namprd11.prod.outlook.com>
References: <BN6PR11MB131514FF11A325A511480816927D0@BN6PR11MB1315.namprd11.prod.outlook.com>
Message-ID: <CAMty3ZBwJJvORrC5_hvJT9UOeijWgJVzEhqMttNRrRoV0szmSw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 14, 2018 at 12:46 PM, Marc Sandusky
<marc_sandusky@outlook.com> wrote:
> Added a default configuration file and supporting board support files
> for the Banana Pi M2 Ultra platform. The port is based on the ports for
> the Banana Pi M1 and Banana Pi M2 Plus platforms, and provides for a
> duplicate feature set. In addition to the default configuration file this
> port includes a boot script, an SD card definition file and a readme file
> explaining its usage.
>
> Signed-off-by: Marc Sandusky <marc_sandusky@outlook.com>
> ---
>  board/bananapi/bananapi-m2u/boot.cmd     |  7 +++++
>  board/bananapi/bananapi-m2u/genimage.cfg | 33 ++++++++++++++++++++++
>  board/bananapi/bananapi-m2u/readme.txt   | 34 ++++++++++++++++++++++
>  configs/bananapi_m2_ultra_defconfig      | 36 ++++++++++++++++++++++++

Please update DEVELOPERS and .gitlab-ci.yml
Once updated on next version,

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
