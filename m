From: Thierry Bultel <thierry.bultel@wanadoo.fr>
Date: Wed, 05 Feb 2014 18:08:26 +0100
Subject: [Buildroot] Integrating ROS in buildroot ?
Message-ID: <52F2700A.2000304@wanadoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am currently working on a project where the is a need for ROS
(http://www.ros.org/) on the target.
ROS is currently no part of buildroot packages. It is part of
Yocto/OpenEmbedded, though.

I am attempting to integrate it, so my first question is if someone-else
already has plan to do so.

My second question is related to one hard point to achieve it:
ROS git repository (see: https://github.com/ros/ros_comm) is composed of
-many- subdirectories, that have to be built with cmake each.

Cloning the repos each time, for building these directories one by one
would be inefficient, and painful, because I do not want
to have such a package granularity.
The other issue is that the current cmake infrastructure does not
support multidir build (yet). So I as thinking about extending it,
but again, would like to be sure if there no other way to to so.

Regards
Thierry


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140205/b39a65cd/attachment.html>
